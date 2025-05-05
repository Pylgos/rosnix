{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-errors,
  ecl-formatters,
  ecl-geometry,
  ecl-license,
  ecl-linear-algebra,
  ecl-math,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_mobile_robot";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_mobile_robot";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-errors ecl-formatters ecl-geometry ecl-license ecl-linear-algebra ecl-math ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-errors ecl-formatters ecl-geometry ecl-license ecl-linear-algebra ecl-math ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_mobile_robot" = substituteSource {
      src = fetchgit {
        name = "ecl_mobile_robot-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "a9c1743d3485af826a0cfa4f960ec5af94841de6";
        hash = "sha256-NQJy3LdrqwiDAynl1fLCbDJz/A4qCxq6VpeaO+fr/4Y=";
      };
    };
  });
  meta = {
    description = "\n    Contains transforms (e.g. differential drive inverse kinematics)\n    for the various types of mobile robot platforms.\n  ";
  };
})
