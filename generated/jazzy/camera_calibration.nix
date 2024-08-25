{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  message_filters,
  python3Packages,
  rclpy,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    camera_calibration = substituteSource {
      src = fetchgit {
        name = "camera_calibration-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "8dbb7a4d835dcbadef8929cc9b82e8ae291e598f";
        hash = "sha256-/1Y3e32+GZEmMxwmY1QjbXJDMqWj5hylEhKW2Et9d7o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_calibration";
  version = "5.0.4-1";
  src = sources.camera_calibration;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry message_filters python3Packages.opencv4 rclpy sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 python3Packages.pytest python3Packages.requests ];
  missingDependencies = [ "python3-semver" ];
  meta = {
    description = "camera_calibration allows easy calibration of monocular or stereo cameras using a checkerboard calibration target.";
  };
}
