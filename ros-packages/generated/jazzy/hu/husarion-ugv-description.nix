{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  husarion-components-description,
  joint-state-publisher,
  joint-state-publisher-gui,
  launch,
  launch-ros,
  mkSourceSet,
  nav2-common,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "husarion_ugv_description";
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."husarion_ugv_description";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ husarion-components-description joint-state-publisher joint-state-publisher-gui launch launch-ros nav2-common robot-state-publisher xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ husarion-components-description joint-state-publisher joint-state-publisher-gui launch launch-ros nav2-common robot-state-publisher xacro ];
  passthru.sources = mkSourceSet (sources: {
    "husarion_ugv_description" = substituteSource {
      src = fetchgit {
        name = "husarion_ugv_description-source";
        url = "https://github.com/ros2-gbp/husarion_ugv_ros-release.git";
        rev = "ba37a0621e24e806ba7f942569bd682c268fcd50";
        hash = "sha256-xnlunaVaCChDW38AUT88Acd4kT2nzZmAMDn3uGOcEHE=";
      };
    };
  });
  meta = {
    description = "The package contains URDF and mesh files for Husarion UGV";
  };
})
