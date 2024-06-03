// Bluemoon edit - Methane gas
// Methane:
/// The minimum temperature methane combusts at. (580 °C or 853 K)
#define METHANE_MINIMUM_BURN_TEMPERATURE 580+T0C
/// The amount of energy released by burning one mole of methane. (890.4 kJ)
#define FIRE_METHANE_ENERGY_RELEASED 8.904e5
/// Multiplier for methane fire with O2 moles * METHANE_OXYGEN_FULLBURN for the maximum fuel consumption
#define METHANE_OXYGEN_FULLBURN 10
/// The divisor for the maximum methane burn rate. (1/9 of the methane can burn in one reaction tick.)
#define FIRE_METHANE_BURN_RATE_DELTA 9

// Bluemoon edit - Methane gas
// Methane Reformation into Hydrogen:
/// The minimum temperature at which hydrogen can form from methane in the presence of H2O.
#define METHANE_REFORMATION_MIN_TEMPERATURE 626+T0C
/// The maximum temperature at which hydrogen can form from methane in the presence of H2O.
#define METHANE_REFORMATION_MAX_TEMPERATURE 826+T0C
/// The minimum pressure at which hydrogen can form from methane in the presence of H2O.
#define METHANE_REFORMATION_MIN_PRESSURE 20
/// The maximum pressure at which hydrogen can form from methane in the presence of H2O.
#define METHANE_REFORMATION_MAX_PRESSURE 172
/// The amount of energy consumed when a mole of methane forms into hydrogen in the presence of H2O. (206 kJ)
#define METHANE_REFORMATION_ENERGY 2.06e5
/// The amount of hydrogen moles released per mole of methane reformed.
#define METHANE_REFORMATION_RATIO 3

// Bluemoon edit - Methane gas
// Sabatier reaction. CO2 and Hydrogen reformation into methane.
/// The minimum temperature at which methane can form from CO2 and H2.
#define SABATIER_REFORMATION_MIN_TEMPERATURE 298+T0C
/// The maximum temperature at which methane can form from CO2 and H2.
#define SABATIER_REFORMATION_MAX_TEMPERATURE 358+T0C
/// The minimum pressure at which methane can form from CO2 and H2.
#define SABATIER_REFORMATION_MIN_PRESSURE 100
/// The maximum pressure at which methane can form from CO2 and H2.
#define SABATIER_REFORMATION_MAX_PRESSURE 10000
/// The amount of energy consumed when 4 moles of hydrogen and 1 mole of CO2 form into methane. (165 kJ)
#define SABATIER_REFORMATION_ENERGY 1.65e5
/// The amount of methane moles released per 4 moles of hydrogen and 1 moles of CO2 reformed.
#define SABATIER_REFORMATION_METHANE_RATIO 1
/// The amount of H2O moles released per 4 moles of hydrogen and 1 moles of CO2 reformed.
#define SABATIER_REFORMATION_H2O_RATIO 2
