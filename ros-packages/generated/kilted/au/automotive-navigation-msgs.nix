{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "automotive_navigation_msgs";
  version = "3.0.4-6";
  src = finalAttrs.passthru.sources."automotive_navigation_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs ros-environment rosidl-default-generators rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "automotive_navigation_msgs" = substituteSource {
      src = fetchgit {
        name = "automotive_navigation_msgs-source";
        url = "https://github.com/ros2-gbp/automotive_autonomy_msgs-release.git";
        rev = "b8b3564bb866d169088c6ef73ed35e7112503a43";
        hash = "sha256-N+QDJUyFWyIto9hqSOYNMPTrVLJR+tIO2J4ExUZ27+0=";
      };
    };
  });
  meta = {
    description = "Generic Messages for Navigation Objectives in Automotive Automation Software";
  };
})
