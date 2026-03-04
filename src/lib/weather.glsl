struct WeatherDay {
	vec3 skyColor;
	float fogginess;
	float blurriness;
	float wind;
};

const int SUN_PHASES = 28;
/*
	// whiteish
	WeatherDay(vec3(0.760, 0.896, 1.000), 50.00, 5.000, 0.05),
	WeatherDay(vec3(0.760, 0.896, 1.000), 35.80, 3.580, 0.13),
	WeatherDay(vec3(0.760, 0.896, 1.000), 23.60, 2.360, 0.24),
	WeatherDay(vec3(0.760, 0.896, 1.000), 50.00, 5.000, 0.36),
	WeatherDay(vec3(0.760, 0.896, 1.000), 35.80, 3.580, 0.48),
	WeatherDay(vec3(0.760, 0.896, 1.000), 23.60, 2.360, 0.63),

	// orangeish
	WeatherDay(vec3(1.000, 0.919, 0.736), 11.60, 1.160, 1.12),
	WeatherDay(vec3(1.000, 0.919, 0.736), 22.00, 2.200, 0.99),
	WeatherDay(vec3(1.000, 0.919, 0.736), 36.60, 3.660, 0.86),
	WeatherDay(vec3(1.000, 0.919, 0.736), 50.00, 5.000, 0.77),

	// yellowish
	WeatherDay(vec3(0.966, 1.000, 0.736), 11.60, 1.160, 0.05),
	WeatherDay(vec3(0.966, 1.000, 0.736), 22.00, 2.200, 0.12),
	WeatherDay(vec3(0.966, 1.000, 0.736), 36.60, 3.660, 0.07),
	WeatherDay(vec3(0.966, 1.000, 0.736), 50.00, 5.000, 0.11),

	// greenish
	WeatherDay(vec3(0.815, 1.000, 0.728), 11.60, 1.160, 1.50),
	WeatherDay(vec3(0.815, 1.000, 0.728), 22.00, 2.200, 2.00),
	WeatherDay(vec3(0.815, 1.000, 0.728), 36.60, 3.660, 2.80),
	WeatherDay(vec3(0.815, 1.000, 0.728), 50.00, 5.000, 3.20),

	// reddish
	WeatherDay(vec3(1.000, 0.802, 0.732), 11.60, 1.160, 0.24),
	WeatherDay(vec3(1.000, 0.802, 0.732), 22.00, 2.200, 0.69),
	WeatherDay(vec3(1.000, 0.802, 0.732), 36.60, 3.660, 0.43),
	WeatherDay(vec3(1.000, 0.802, 0.732), 50.00, 5.000, 0.05),

	// tealish
	WeatherDay(vec3(0.664, 0.975, 1.000), 5.800, .5800, 3.53),
	WeatherDay(vec3(0.664, 0.975, 1.000), 7.000, .7000, 2.64),
	WeatherDay(vec3(0.664, 0.975, 1.000), 8.800, .8800, 1.88),
	WeatherDay(vec3(0.664, 0.975, 1.000), 11.60, 1.160, 1.18),

	// pinkish
	WeatherDay(vec3(0.834, 0.728, 1.000), 26.80, 2.680, 1.00),
	WeatherDay(vec3(0.834, 0.728, 1.000), 42.20, 4.220, 1.00)
*/
const WeatherDay sunPhaseRampColors[SUN_PHASES] = WeatherDay[](
	WeatherDay(vec3(1.000, 0.919, 0.736), 50.00, 5.000, 0.77),
	WeatherDay(vec3(0.815, 1.000, 0.728), 18.60, 1.160, 1.50),
	WeatherDay(vec3(0.815, 1.000, 0.728), 22.00, 2.200, 2.00),
	WeatherDay(vec3(0.815, 1.000, 0.728), 50.00, 5.000, 3.20),
	WeatherDay(vec3(0.760, 0.896, 1.000), 23.60, 2.360, 0.63),
	WeatherDay(vec3(1.000, 0.919, 0.736), 18.60, 1.160, 1.12),
	WeatherDay(vec3(0.834, 0.728, 1.000), 26.80, 2.680, 1.00),
	WeatherDay(vec3(0.966, 1.000, 0.736), 36.60, 3.660, 0.07),
	WeatherDay(vec3(0.760, 0.896, 1.000), 35.80, 3.580, 0.13),
	WeatherDay(vec3(0.760, 0.896, 1.000), 50.00, 5.000, 0.36),
	WeatherDay(vec3(0.664, 0.975, 1.000), 10.80, .8800, 1.88),
	WeatherDay(vec3(0.760, 0.896, 1.000), 23.60, 2.360, 0.24),
	WeatherDay(vec3(0.966, 1.000, 0.736), 18.60, 1.160, 0.05),
	WeatherDay(vec3(0.966, 1.000, 0.736), 22.00, 2.200, 0.12),
	WeatherDay(vec3(1.000, 0.802, 0.732), 22.00, 2.200, 0.69),
	WeatherDay(vec3(1.000, 0.802, 0.732), 18.60, 1.160, 0.24),
	WeatherDay(vec3(0.664, 0.975, 1.000), 10.00, .7000, 2.64),
	WeatherDay(vec3(0.966, 1.000, 0.736), 50.00, 5.000, 0.11),
	WeatherDay(vec3(0.760, 0.896, 1.000), 35.80, 3.580, 0.48),
	WeatherDay(vec3(1.000, 0.802, 0.732), 50.00, 5.000, 0.05),
	WeatherDay(vec3(0.815, 1.000, 0.728), 36.60, 3.660, 2.80),
	WeatherDay(vec3(0.664, 0.975, 1.000), 18.60, 1.160, 1.18),
	WeatherDay(vec3(1.000, 0.919, 0.736), 36.60, 3.660, 0.86),
	WeatherDay(vec3(1.000, 0.802, 0.732), 36.60, 3.660, 0.43),
	WeatherDay(vec3(0.834, 0.728, 1.000), 42.20, 4.220, 1.00),
	WeatherDay(vec3(1.000, 0.919, 0.736), 22.00, 2.200, 0.99),
	WeatherDay(vec3(0.760, 0.896, 1.000), 50.00, 5.000, 0.05),
	WeatherDay(vec3(0.664, 0.975, 1.000), 10.80, .5800, 3.53)
);

const int MOON_PHASES = 32;
const WeatherDay moonPhaseRampColors[MOON_PHASES] = WeatherDay[](
	WeatherDay(vec3(0.090, 0.197, 0.174), 60.410, .6410, 0.71),
	WeatherDay(vec3(0.239, 0.419, 0.248), 80.659, .8659, 0.52),
	WeatherDay(vec3(0.230, 0.299, 0.185), 210.28, 2.128, 0.06),
	WeatherDay(vec3(0.102, 0.269, 0.212), 230.74, 2.374, 0.57),
	WeatherDay(vec3(0.066, 0.091, 0.146), 150.21, 1.521, 0.52),
	WeatherDay(vec3(0.220, 0.334, 0.255), 150.70, 1.570, 0.41),
	WeatherDay(vec3(0.058, 0.095, 0.104), 120.68, 1.268, 0.51),
	WeatherDay(vec3(0.099, 0.146, 0.091), 60.341, .6341, 0.26),
	WeatherDay(vec3(0.357, 0.427, 0.168), 50.634, .5634, 0.92),
	WeatherDay(vec3(0.101, 0.165, 0.138), 160.83, 1.683, 0.61),
	WeatherDay(vec3(0.183, 0.385, 0.361), 130.20, 1.320, 0.10),
	WeatherDay(vec3(0.208, 0.371, 0.211), 100.45, 1.045, 0.93),
	WeatherDay(vec3(0.099, 0.192, 0.253), 230.45, 2.345, 0.24),
	WeatherDay(vec3(0.235, 0.385, 0.324), 80.899, .8899, 0.65),
	WeatherDay(vec3(0.264, 0.430, 0.416), 220.38, 2.238, 0.43),
	WeatherDay(vec3(0.096, 0.121, 0.148), 50.744, .5744, 0.53),
	WeatherDay(vec3(0.096, 0.119, 0.078), 220.56, 2.256, 0.96),
	WeatherDay(vec3(0.319, 0.391, 0.190), 220.28, 2.228, 0.61),
	WeatherDay(vec3(0.172, 0.304, 0.258), 230.38, 2.338, 0.63),
	WeatherDay(vec3(0.235, 0.351, 0.200), 130.33, 1.333, 0.62),
	WeatherDay(vec3(0.182, 0.276, 0.118), 70.878, .7878, 0.88),
	WeatherDay(vec3(0.141, 0.330, 0.315), 200.86, 2.086, 0.58),
	WeatherDay(vec3(0.067, 0.107, 0.193), 80.538, .8538, 0.58),
	WeatherDay(vec3(0.098, 0.181, 0.283), 120.40, 1.240, 0.74),
	WeatherDay(vec3(0.244, 0.434, 0.486), 230.98, 2.398, 0.98),
	WeatherDay(vec3(0.221, 0.266, 0.344), 80.983, .8983, 0.22),
	WeatherDay(vec3(0.066, 0.189, 0.114), 210.84, 2.184, 0.33),
	WeatherDay(vec3(0.161, 0.230, 0.140), 150.33, 1.533, 0.63),
	WeatherDay(vec3(0.395, 0.461, 0.244), 200.12, 2.012, 0.86),
	WeatherDay(vec3(0.189, 0.461, 0.301), 190.15, 1.915, 0.59),
	WeatherDay(vec3(0.076, 0.100, 0.058), 170.25, 1.725, 0.12),
	WeatherDay(vec3(0.110, 0.139, 0.214), 130.00, 1.300, 0.59)
);

const int WACKY_DAY_COLORS = 32;
const WeatherDay wackyDayColors[WACKY_DAY_COLORS] = WeatherDay[](
	WeatherDay(vec3(0.000, 0.032, 0.855), 5.16, 1.0, 0.00),
	WeatherDay(vec3(0.000, 0.810, 0.447), 14.0, 1.0, 0.00),
	WeatherDay(vec3(0.000, 0.741, 0.469), 9.88, 1.0, 0.00),
	WeatherDay(vec3(0.423, 0.000, 0.821), 17.1, 1.0, 0.00),
	WeatherDay(vec3(0.067, 0.000, 0.339), 8.21, 1.0, 0.00),
	WeatherDay(vec3(0.497, 0.000, 0.809), 17.3, 1.0, 0.00),
	WeatherDay(vec3(0.343, 0.000, 0.577), 12.3, 1.0, 0.00),
	WeatherDay(vec3(0.390, 0.000, 0.837), 11.6, 1.0, 0.00),
	WeatherDay(vec3(0.318, 0.041, 0.000), 7.74, 1.0, 0.00),
	WeatherDay(vec3(0.000, 0.754, 0.054), 16.7, 1.0, 0.00),
	WeatherDay(vec3(0.635, 0.000, 0.993), 24.6, 1.0, 0.00),
	WeatherDay(vec3(0.033, 0.777, 0.000), 7.09, 1.0, 0.00),
	WeatherDay(vec3(0.280, 0.027, 0.000), 12.1, 1.0, 0.00),
	WeatherDay(vec3(0.568, 0.090, 0.000), 17.7, 1.0, 0.00),
	WeatherDay(vec3(0.527, 0.000, 0.995), 12.6, 1.0, 0.00),
	WeatherDay(vec3(0.000, 0.217, 0.542), 6.73, 1.0, 0.00),
	WeatherDay(vec3(0.291, 0.000, 0.669), 11.6, 1.0, 0.00),
	WeatherDay(vec3(0.760, 0.165, 0.000), 14.3, 1.0, 0.00),
	WeatherDay(vec3(0.000, 0.389, 0.816), 11.6, 1.0, 0.00),
	WeatherDay(vec3(8.000, 8.960, 8.064), 22.8, 1.0, 0.00),
	WeatherDay(vec3(0.000, 0.962, 0.022), 7.45, 1.0, 0.00),
	WeatherDay(vec3(0.190, 0.991, 0.000), 22.7, 1.0, 0.00),
	WeatherDay(vec3(0.678, 0.051, 0.000), 17.8, 1.0, 0.00),
	WeatherDay(vec3(0.083, 0.000, 0.423), 5.74, 1.0, 0.00),
	WeatherDay(vec3(0.475, 0.034, 0.000), 15.5, 1.0, 0.00),
	WeatherDay(vec3(0.843, 0.200, 0.000), 15.3, 1.0, 0.00),
	WeatherDay(vec3(0.403, 0.060, 0.000), 10.5, 1.0, 0.00),
	WeatherDay(vec3(0.381, 0.000, 0.616), 5.48, 1.0, 0.00),
	WeatherDay(vec3(0.000, 0.039, 0.766), 10.9, 1.0, 0.00),
	WeatherDay(vec3(0.062, 0.000, 0.352), 10.7, 1.0, 0.00),
	WeatherDay(vec3(0.000, 0.785, 0.472), 14.2, 1.0, 0.00),
	WeatherDay(vec3(0.010, 0.000, 0.667), 12.3, 1.0, 0.00)
);

const int WACKY_NIGHT_COLORS = 32;
const WeatherDay wackyNightColors[WACKY_NIGHT_COLORS] = WeatherDay[](
	WeatherDay(vec3(0.062, 0.000, 0.352), 0.16, 0.16, 0.00),
	WeatherDay(vec3(0.000, 0.032, 0.855), 9.03, 9.03, 0.00),
	WeatherDay(vec3(0.000, 0.754, 0.054), 4.88, 4.88, 0.00),
	WeatherDay(vec3(0.190, 0.991, 0.000), 12.1, 12.1, 0.00),
	WeatherDay(vec3(0.423, 1.000, 5.821), 3.21, 3.21, 0.00),
	WeatherDay(vec3(0.083, 0.000, 0.423), 12.3, 12.3, 0.00),
	WeatherDay(vec3(0.678, 0.051, 0.000), 7.25, 7.25, 0.00),
	WeatherDay(vec3(0.381, 0.000, 0.616), 6.57, 6.57, 0.00),
	WeatherDay(vec3(0.000, 0.039, 0.766), 2.74, 2.74, 0.00),
	WeatherDay(vec3(0.318, 0.041, 0.000), 11.7, 11.7, 0.00),
	WeatherDay(vec3(2.843, 2.200, 2.000), 19.6, 19.6, 0.00),
	WeatherDay(vec3(0.000, 0.785, 0.472), 2.09, 2.09, 0.00),
	WeatherDay(vec3(0.475, 0.034, 0.000), 7.11, 7.11, 0.00),
	WeatherDay(vec3(0.568, 0.090, 0.000), 12.7, 12.7, 0.00),
	WeatherDay(vec3(0.067, 0.000, 0.339), 7.62, 7.62, 0.00),
	WeatherDay(vec3(0.033, 0.777, 0.000), 1.73, 1.73, 0.00),
	WeatherDay(vec3(0.000, 0.810, 0.447), 6.55, 6.55, 0.00),
	WeatherDay(vec3(0.497, 0.000, 0.809), 9.28, 9.28, 0.00),
	WeatherDay(vec3(0.280, 0.027, 0.000), 6.58, 6.58, 0.00),
	WeatherDay(vec3(0.635, 0.000, 0.993), 17.8, 17.8, 0.00),
	WeatherDay(vec3(0.760, 0.165, 0.000), 2.45, 2.45, 0.00),
	WeatherDay(vec3(0.000, 0.960, 0.064), 17.7, 17.7, 0.00),
	WeatherDay(vec3(0.000, 0.741, 0.469), 12.8, 12.8, 0.00),
	WeatherDay(vec3(0.527, 0.000, 0.995), .736, .736, 0.00),
	WeatherDay(vec3(0.291, 0.000, 0.669), 10.5, 10.5, 0.00),
	WeatherDay(vec3(3.403, 0.060, 0.000), 10.3, 10.3, 0.00),
	WeatherDay(vec3(0.000, 0.389, 0.816), 5.53, 5.53, 0.00),
	WeatherDay(vec3(0.000, 0.962, 0.022), .478, .478, 0.00),
	WeatherDay(vec3(0.343, 0.000, 0.577), 5.85, 5.85, 0.00),
	WeatherDay(vec3(0.000, 0.217, 0.542), 5.70, 5.70, 0.00),
	WeatherDay(vec3(0.010, 0.000, 0.667), 9.23, 9.23, 0.00),
	WeatherDay(vec3(0.390, 0.000, 0.837), 7.33, 7.33, 0.00)
);

#define weatherDay (worldDay + (worldTime + 6000) / 24000)
#define weatherNight (worldDay + (worldTime - 6000) / 24000)

int WACKY_DAY_COLOR_INTERVAL = 31;
int WACKY_DAY_COLOR_OFFSET = 12;
int WACKY_NIGHT_COLOR_INTERVAL = 48;
int WACKY_NIGHT_COLOR_OFFSET = 33;

WeatherDay getSunPhase() {
	int day = weatherDay;

	if(day % WACKY_DAY_COLOR_INTERVAL == WACKY_DAY_COLOR_OFFSET) return wackyDayColors[(day - WACKY_DAY_COLOR_OFFSET) / WACKY_DAY_COLOR_INTERVAL];
    return sunPhaseRampColors[day % SUN_PHASES];
}

WeatherDay getMoonPhase() {
	int night = weatherNight;

	if(night % WACKY_NIGHT_COLOR_INTERVAL == WACKY_NIGHT_COLOR_OFFSET) return wackyNightColors[(night - WACKY_NIGHT_COLOR_OFFSET) / WACKY_NIGHT_COLOR_INTERVAL];
    return moonPhaseRampColors[night % MOON_PHASES];
}

const float fogginess = 1.0;
const float blurriness = 0.2;

// fade from night to day density within margin of 60 seconds (7tps, 420 ticks)
float getAtmosphericDensity() {
	if(worldTime < 12000) {
		return getSunPhase().fogginess * fogginess;
	}
	if(worldTime < 12480) {
		return mix(
			getSunPhase().fogginess,
			getMoonPhase().fogginess,
			float(worldTime - 12000) / 480.
		) * fogginess;
	}
	if(worldTime < 23520) {
		return getMoonPhase().fogginess * fogginess;
	}
	return mix(
		getMoonPhase().fogginess,
		getSunPhase().fogginess,
		float(worldTime - 23520) / 480.
	) * fogginess;
}

float getBloomyFog() {
	if(worldTime < 12000) {
		return getSunPhase().blurriness * blurriness;
	}
	if(worldTime < 12480) {
		return mix(
			getSunPhase().blurriness,
			getMoonPhase().blurriness,
			float(worldTime - 12000) / 480.
		) * blurriness;
	}
	if(worldTime < 23520) {
		return getMoonPhase().blurriness * blurriness;
	}
	return mix(
		getMoonPhase().blurriness,
		getSunPhase().blurriness,
		float(worldTime - 23520) / 480.
	) * blurriness;
}

float getWavyStrength() {
	if(worldTime < 12000) {
		return getSunPhase().wind;
	}
	if(worldTime < 12480) {
		return mix(
			getSunPhase().wind,
			getMoonPhase().wind,
			float(worldTime - 12000) / 480.
		);
	}
	if(worldTime < 23520) {
		return getMoonPhase().wind;
	}
	return mix(
		getMoonPhase().wind,
		getSunPhase().wind,
		float(worldTime - 23520) / 480.
	);
}