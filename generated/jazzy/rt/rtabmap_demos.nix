{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
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
    rtabmap_demos-b03e98ea5ed3302f06616f751b8b28008f8259dd = substituteSource {
      src = fetchgit {
        name = "rtabmap_demos-b03e98ea5ed3302f06616f751b8b28008f8259dd-source";
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
  src = sources.rtabmap_demos-b03e98ea5ed3302f06616f751b8b28008f8259dd;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rtabmap_odom rtabmap_rviz_plugins rtabmap_slam rtabmap_util rtabmap_viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "RTAB-Map's demo launch files.";
  };
}
