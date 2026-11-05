# UCiSW 1 (Układy Cyfrowe i Systemy Wbudowane 1), PWr: laboratorium

Repozytorium z materiałami i rozwiązaniami do laboratorium: VHDL, AMD Vivado, płyta **AUP-ZU3** (Zynq UltraScale+ `xczu3eg-sfvc784-2-e`) z płytą rozszerzającą (OLED, PS/2, VGA, HDMI, enkoder).

## Użytkownik i styl współpracy
- Student, który zaczyna pracę z Vivado. Odpowiadaj **po polsku**.
- Instrukcje i notatki pisz **krok po kroku, prosto, dla początkującego**. Dodawaj ramki „✔ SPRAWDŹ” (co ma być widać na ekranie) i sekcję „Coś nie działa”.
- Notatki i instrukcje oddawaj jako **PDF**, nie Markdown („zrób mi czytelnego fajnego pdf-a, a nie markdowna”).
- Na zajęciach użytkownik przysyła zdjęcia ekranu (diagram, błąd, okno dialogowe). Odpowiadaj konkretnie: co kliknąć, gdzie jest plik, czy połączenia są dobre (tabela ✔/❌).

## Środowisko: kluczowe ograniczenie
- Komputer użytkownika to **MacBook M4 (arm64)**. **Vivado nie działa na macOS.** Projekty w Vivado robi się na komputerach w laboratorium: Windows, sala 016 C-3, projekty w `C:\AMD_Proj`.
- Na Macu kod sprawdzamy symulatorem **nvc** (`brew install nvc`):
  - `nvc -a <pliki.vhd> -e [-gK=..] <tb> -r [--stop-time=2500ns]`
  - Gdy testbench ma zegar działający w nieskończoność, **zawsze** podawaj `--stop-time`, bo inaczej symulacja wisi.
  - Prymitywy UNISIM (`IBUFDS`, `BUFG`) i netlista `OLED_1x32` nie skompilują się w nvc. Do lokalnego testu używaj **atrap** (stubów) w scratchpadzie. Nie wrzucaj ich do repozytorium.
- Weryfikacja przed oddaniem:
  - równania sprawdź skryptem Pythona dla wszystkich 16 wartości X,
  - testbench ma proces `Check` z `assert`, a w logu musi być „Koniec testu” i brak komunikatów „Blad”,
  - test negatywny: zły wariant musi dawać błędy.

## Struktura repozytorium
- `pliki/`: materiały od prowadzącego: `OLED_1x32.vhd` (netlista ze strukturą UNISIM, w środku są IOBUF-y), `ZU3.xdc`, `ZU3_Exp.xdc`, PDF-y (`UCiSW1_W1.pdf`, `UCSW1_TematyLab.pdf`, `Vivado_Instalacja.pdf`), zipy modułów.
- `Vivado_Instrukcja.pdf`, `Exp_board.pdf`: dokumentacja prowadzącego (J. Sugier). Źródło procedur Vivado.
- `Lab1_c/`: **właściwe rozwiązanie lab 1, wariant c), Y = (4 − X) mod 16**, zadania Z1–Z4, oraz `Lab1_wariant_c.pdf`.
- `Z1/`, `Z2/`, `Instrukcja_Vivado_Z1_Z2.pdf`: wcześniejsze przygotowanie na **przykładowych** wariantach (X±1, X±3) i pierwsza wersja zadania z OLED (`Z2_Top.vhd` z trybem AUTO). Polecenie z zajęć okazało się inne (patrz niżej).

## Lab 1: polecenie z zajęć (obowiązujące)
- **Z1:** 4-bitowy układ kombinacyjny. X i Y to `std_logic_vector(3 downto 0)` w naturalnym kodzie binarnym (NKB). Minimalizacja Y(0)…Y(3) w tablicach Karnaugha. Symulacja behawioralna dla X = 0…15: `X <= "0000", "0001" after 100 ns, …`. Warianty: a) (16−X), b) (14−X), **c) (4−X)**, d) (2−X), wszystkie mod 16.
- **Z2:** sprzęt: X ← PL_USER_SW(3:0), Y → PL_USER_LED(3:0). Do tego symulacja czasowa przełączania bitów Y dla zmiany **Y: 8 → 7**.
- **Z3:** diagram blokowy: Z1 jako moduł, X i Y na wyświetlaczu `OLED_1x32`.
- **Z4:** to samo działanie zrobione przez IP **Adder/Subtracter** (c_addsub). Jego wynik też trafia na OLED.

### Wariant c): ustalenia
- Równania (sprawdzone):
  - `Y0 = X0` (zwykły przewód)
  - `Y1 = X1 ⊕ X0`
  - `Y2 = x2x1 + x2x0 + x̄2x̄1x̄0` (XNOR z x1+x0)
  - `Y3 = x3x̄2 + x3x̄1x̄0 + x̄3x2x1 + x̄3x2x0`
- Y: 8 → 7 odpowiada zmianie X: 12 → 13, w testbenchu w chwili **1300 ns**. Na wejściu zmienia się 1 bit, na wyjściu **wszystkie 4 bity** (1000 → 0111), co daje możliwe hazardy (glitche). Domyślna symulacja trwa 1000 ns, więc w Tcl Console potrzebne jest `run 500 ns`.
- Z3 na OLED: `X      Y` (szesnastkowo, Blank = 126).
- Z4 na OLED: `X     YS`, gdzie S to wynik subtraktora. Dwie ostatnie cyfry muszą być równe. Concat: In0 = S(4), In1 = Y(4), In2 = 0(20), In3 = X(4). Blank = 124.
- Subtraktor IP: Fabric, Subtract, Unsigned 4/4, Output Width 4, **Latency 0**, A = stała 4, B = X, **CE wyłączone** (zakładka Control).

## Konwencje kodu VHDL
- Encja układu nazywa się zawsze `Z1`, porty `X`, `Y`. Jeden plik na wariant, w projekcie tylko jeden naraz. Testbench `Z1_tb` deklaruje `component Z1`, tak jak uczy instrukcja prowadzącego.
- Pisz w zgodzie z **VHDL-93** (domyślny tryb Vivado):
  - w `port map` nie wolno używać wyrażeń (np. konkatenacji); zrób sygnał pośredni,
  - mieszając `and`/`or`, zawsze używaj nawiasów.
- Komentarze w kodzie piszemy po polsku bez polskich znaków, w stylu istniejących plików.
- Zegar w czystym VHDL: `IBUFDS` + `BUFG` (instrukcja, rozdz. 6.2), a w XDC odkomentowane linie `CLK_100MHz_*`. W diagramie blokowym zegar daje **Clocking Wizard** (Board → Differential Clock → Auto Connect) i wtedy linii zegara w XDC **nie** dajemy.

## Płyta: fakty (z ZU3.xdc / ZU3_Exp.xdc)
- SW0–3: AB1, AF1, AE3, AC2 · SW7: AD2 · LED0–7: AF5, AE7, AH2, AE5, AH1, AE4, AG1, AF2. Wszystkie `LVCMOS12`.
- Zegar: D7/D6, `LVDS`, 100 MHz. OLED: SCL AE12, SDA AF12, `LVCMOS33`.
- `OLED_1x32`:
  - porty: `Clk_100MHz`, `Line[31:0]` (8 cyfr szesnastkowych), `DecPts[7:0]`, `Blank[7:0]` (1 = cyfra ukryta), `I2C_NACK`, `OLED_SDA/SCL` (inout),
  - odświeżanie ok. 50 Hz,
  - kolejność cyfr wg przykładu prowadzącego: `In0` w Concat (najmłodsze bity) = **prawa** cyfra.
- „Zmiana co 100 ns” dotyczy tylko testbencha. Na płycie jest niewidoczna, dlatego `Z2/Z2_Top.vhd` ma generic `STEP_CYCLES` (10 = 100 ns w symulacji, 100E6 = 1 s na płycie).

## Wiedza praktyczna z zajęć (Vivado)
- Plik `.bit` jest w `<projekt>\<projekt>.runs\impl_1\<top>.bit`. Dla diagramu to `<bd>_wrapper.bit`. Ścieżkę pokaże `glob [get_property DIRECTORY [get_runs impl_1]]/*.bit`.
- Po zmianie diagramu ponowne budowanie **kasuje stary `.bit`**. Nowy pojawia się dopiero po „write_bitstream Complete”.
- Kolejność etapów: `<ip>_synth_1` (synteza klocka IP, out-of-context) → `synth_design` → place/route → `write_bitstream`. Nie przerywać.
- `BD 41-759` (niepodłączone wejście ustawione na 0): ostrzeżenie dla samego `DecPts` jest w porządku. Jeśli na liście jest `Line`, brakuje połączenia Concat → OLED (częsty błąd).
- `Make External` dopisuje do nazw portów `_0`. Trzeba je zmienić na nazwy z XDC (`OLED_SDA`, `OLED_SCL`, `NACK`).
- Płyty nie wyłączamy między zadaniami: symulacja czasowa jest tylko w programie, a po wyłączeniu FPGA traci konfigurację.

## Generowanie PDF-ów
- Sposób: Python generuje HTML (CSS, kolorowe mapy Karnaugha, ramki), potem Chrome w trybie bez okna drukuje PDF:
  `"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless --no-pdf-header-footer --print-to-pdf=out.pdf file://…/x.html`
- Kod VHDL i XDC w PDF-ie wczytuj **z plików w repozytorium**, nie przepisuj ręcznie. Wtedy PDF zawsze zgadza się z kodem, który przeszedł symulację.
- Zrzuty ekranu wycinamy z `Vivado_Instrukcja.pdf`: `pdftoppm -r 200`, potem `sips -c H W --cropOffset Y X`.
- Podgląd stron przed oddaniem: `pdftoppm -r 50` i zestawienie miniatur. Sprawdzaj puste strony i osierocone nagłówki.
- Skrypty generujące (`make_*.py`) były w scratchpadzie sesji i **nie ma ich w repozytorium**. Żeby zmienić PDF, trzeba je odtworzyć.
