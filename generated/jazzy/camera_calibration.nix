{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  cv_bridge,
  fetchFromGitHub,
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
    camera_calibration = substituteSource {
      src = fetchFromGitHub {
        name = "camera_calibration-source";
        owner = "ros2-gbp";
        repo = "image_pipeline-release";
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
