{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-exceptions,
  ecl-formatters,
  ecl-geometry,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_manipulators";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_manipulators";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-exceptions ecl-formatters ecl-geometry ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-exceptions ecl-formatters ecl-geometry ecl-license ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_manipulators" = substituteSource {
      src = fetchgit {
        name = "ecl_manipulators-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "918c1d66427daaa5f9454b3fc53b1e5125c80a22";
        hash = "sha256-O2B7UtubuHvctssWyG6E5OwnApjjdWF+m62+6Da9Qy4=";
      };
    };
  });
  meta = {
    description = "\n    Deploys various manipulation algorithms, currently just\n    feedforward filters (interpolations).\n  ";
  };
})
