{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  imu_complementary_filter,
  imu_filter_madgwick,
  rviz_imu_plugin,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    imu_tools = substituteSource {
      src = fetchgit {
        name = "imu_tools-source";
        url = "https://github.com/ros2-gbp/imu_tools-release.git";
        rev = "df19112520926bebd06030f598ac67b9e1c7b9fb";
        hash = "sha256-+i6Cvdit5GQDlcCdOUAFdg6ESROTgWjJQ1IqxGC94Ug=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_tools";
  version = "2.1.3-4";
  src = sources.imu_tools;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ imu_complementary_filter imu_filter_madgwick rviz_imu_plugin ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Various tools for IMU devices";
  };
}
