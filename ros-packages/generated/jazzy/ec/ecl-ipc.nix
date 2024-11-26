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
  ecl-threads,
  ecl-time,
  ecl-time-lite,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_ipc";
  version = "1.2.1-5";
  src = finalAttrs.passthru.sources."ecl_ipc";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-errors ecl-exceptions ecl-license ecl-threads ecl-time ecl-time-lite ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_ipc" = substituteSource {
      src = fetchgit {
        name = "ecl_ipc-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "591c2d181016f5c4ea267c904d7da916fd09074a";
        hash = "sha256-VScic0GudpLDyw3R7bdxdgKjaPeyx0ynFGMpfB66eRo=";
      };
    };
  });
  meta = {
    description = "Interprocess mechanisms vary greatly across platforms - sysv, posix, win32, there are more than a few. This package provides an infrastructure to allow for developing cross platform c++ wrappers around the lower level c api's that handle these mechanisms. These make it not only easier to utilise such mechanisms, but allow it to be done consistently across platforms.";
  };
})
