{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-errors,
  ecl-exceptions,
  ecl-license,
  ecl-time-lite,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_time";
  version = "1.2.1-4";
  src = finalAttrs.passthru.sources."ecl_time";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-errors ecl-exceptions ecl-license ecl-time-lite ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-exceptions ecl-license ecl-time-lite ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_time" = substituteSource {
      src = fetchgit {
        name = "ecl_time-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "bfac3621ddab8cc4f30d4e429b54d93886f860e1";
        hash = "sha256-SC1B6uuNMjWdHD10L5nXdVvgkguZSiwRc1i/zONxu5E=";
      };
    };
  });
  meta = {
    description = "\n    Timing utilities are very dependent on the system api provided for their use.\n	This package provides a means for handling different timing models. Current support\n\n	- posix rt : complete.\n	- macosx : posix timers only, missing absolute timers.\n	- win : none.\n  ";
  };
})
