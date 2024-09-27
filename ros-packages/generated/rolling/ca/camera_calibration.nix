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
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    camera_calibration-4540d864121d29e03cb2144643d6d9a001191216 = substituteSource {
      src = fetchgit {
        name = "camera_calibration-4540d864121d29e03cb2144643d6d9a001191216-source";
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
  src = sources.camera_calibration-4540d864121d29e03cb2144643d6d9a001191216;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_geometry message_filters rclpy sensor_msgs std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" "python3-semver" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-requests" ]; };
  meta = {
    description = "camera_calibration allows easy calibration of monocular or stereo cameras using a checkerboard calibration target.";
  };
}
