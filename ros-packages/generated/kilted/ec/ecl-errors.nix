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
  version = "1.2.0-5";
  src = finalAttrs.passthru.sources."ecl_errors";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ecl-build ecl-config ecl-license ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ecl-build ecl-config ecl-license ];
  passthru.sources = mkSourceSet (sources: {
    "ecl_errors" = substituteSource {
      src = fetchgit {
        name = "ecl_errors-source";
        url = "https://github.com/ros2-gbp/ecl_lite-release.git";
        rev = "6fa6ff51fad04a1f1aad38f6b0085c52c3711681";
        hash = "sha256-tMZvRB3bre8Dk+0YS+OqnkCGKff09J6PKWHytWxelmk=";
      };
    };
  });
  meta = {
    description = "\n    This library provides lean and mean error mechanisms.\n    It includes c style error functions as well as a few\n    useful macros. For higher level mechanisms,\n    refer to ecl_exceptions.\n  ";
  };
})
