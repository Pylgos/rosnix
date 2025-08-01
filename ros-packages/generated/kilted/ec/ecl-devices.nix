{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-containers,
  ecl-errors,
  ecl-license,
  ecl-mpl,
  ecl-threads,
  ecl-type-traits,
  ecl-utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_devices";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_devices";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-containers ecl-errors ecl-license ecl-mpl ecl-threads ecl-type-traits ecl-utilities ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-containers ecl-errors ecl-license ecl-mpl ecl-threads ecl-type-traits ecl-utilities ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_devices" = substituteSource {
      src = fetchgit {
        name = "ecl_devices-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "7251e0aae479f6c48eecb9ad7a7c716273d231fc";
        hash = "sha256-fdhKBuF9q7x8XDG5ld90RQRXHhZf4I6pJGU5KK6EOeI=";
      };
    };
  });
  meta = {
    description = "\n     Provides an extensible and standardised framework for input-output devices.\n  ";
  };
})
