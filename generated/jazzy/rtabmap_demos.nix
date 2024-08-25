{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rtabmap_odom,
  rtabmap_rviz_plugins,
  rtabmap_slam,
  rtabmap_util,
  rtabmap_viz,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    rtabmap_demos = substituteSource {
      src = fetchgit {
        name = "rtabmap_demos-source";
        url = "https://github.com/introlab/rtabmap_ros-release.git";
        rev = "b03e98ea5ed3302f06616f751b8b28008f8259dd";
        hash = "sha256-Qc3vsvY2lKUl18v5CqCb2wJYULTdR3yzrxJhreb+Rp8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rtabmap_demos";
  version = "0.21.5-3";
  src = sources.rtabmap_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rtabmap_odom rtabmap_rviz_plugins rtabmap_slam rtabmap_util rtabmap_viz ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "RTAB-Map's demo launch files.";
  };
}
