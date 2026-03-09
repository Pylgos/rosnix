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
  version = "0.2.1-2";
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
        rev = "292a83803f79fac3683eb1a0ffc2cb85ef4a0302";
        hash = "sha256-AZf3Z+PTbGkOFVzMf/Uu4NrQpoQhsQeT6iVUrR0yBMg=";
      };
    };
  });
  meta = {
    description = "Clearpath's simulation package for Ewellix TLT lifting columns";
  };
})
