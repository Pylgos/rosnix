{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    transmission_interface-3be2fc16ebe0dc10905fc699c5f8337fc5cf4ec9 = substituteSource {
      src = fetchgit {
        name = "transmission_interface-3be2fc16ebe0dc10905fc699c5f8337fc5cf4ec9-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "3be2fc16ebe0dc10905fc699c5f8337fc5cf4ec9";
        hash = "sha256-FiySKPHoELD1rFJrA5iYI75YFVo4RDcPiFxZO7oQIVY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "transmission_interface";
  version = "4.17.0-1";
  src = sources.transmission_interface-3be2fc16ebe0dc10905fc699c5f8337fc5cf4ec9;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ hardware_interface pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "transmission_interface contains data structures for representing mechanical transmissions, methods for propagating values between actuator and joint spaces and tooling to support this.";
  };
}
