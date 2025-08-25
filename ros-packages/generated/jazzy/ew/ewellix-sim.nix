{
  ament-cmake,
  buildAmentCmakePackage,
  ewellix-interfaces,
  ewellix-moveit-config,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-ros2-control,
  mkSourceSet,
  ros-gz,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ewellix_sim";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."ewellix_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-interfaces ewellix-moveit-config gz-ros2-control ros-gz rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-interfaces ewellix-moveit-config gz-ros2-control ros-gz rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_sim" = substituteSource {
      src = fetchgit {
        name = "ewellix_sim-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "ba726dff40a6efa8d7779d9782baac0d587f466e";
        hash = "sha256-QsN+WQQW3D3JBXqvwIwy6v7R8RCKNfy9VAyaq8d7e0s=";
      };
    };
  });
  meta = {
    description = "Clearpath's simulation package for Ewellix TLT lifting columns";
  };
})
