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
        rev = "4540d864121d29e03cb2144643d6d9a001191216";
        hash = "sha256-MTFMO5104XrBkDXWhorawdO0E2H/F8xqMCoDhTuITvo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_calibration";
  version = "6.0.3-1";
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
