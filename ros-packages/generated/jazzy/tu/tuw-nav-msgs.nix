{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_nav_msgs";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."tuw_nav_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs nav-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_nav_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_nav_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "af8c1dca01b49e68d02e8cf93915f1a01c10a47a";
        hash = "sha256-vrhAXgvm/w6tOqKmTmzqzvY3PLDjtNyZGeORrdT7Xvg=";
      };
    };
  });
  meta = {
    description = "The tuw_nav_msgs package";
  };
})
