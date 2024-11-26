{
  ament-cmake-ros,
  buildAmentCmakePackage,
  ecl-build,
  ecl-config,
  ecl-license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ecl_errors";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."ecl_errors";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_errors" = substituteSource {
      src = fetchgit {
        name = "ecl_errors-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "5a23e831f2c3b763d31cec43181e94b67713142c";
        hash = "sha256-tMZvRB3bre8Dk+0YS+OqnkCGKff09J6PKWHytWxelmk=";
      };
    };
  });
  meta = {
    description = "This library provides lean and mean error mechanisms. It includes c style error functions as well as a few useful macros. For higher level mechanisms, refer to ecl_exceptions.";
  };
})
