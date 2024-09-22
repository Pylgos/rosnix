{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  data_tamer_msgs,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap_vendor,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    data_tamer_cpp = substituteSource {
      src = fetchFromGitHub {
        name = "data_tamer_cpp-source";
        owner = "ros2-gbp";
        repo = "data_tamer-release";
        rev = "5274316290956c5257fb416f790585cc9aa31cd6";
        hash = "sha256-2AzGQXKFYJAAluNZytnO9/Or37ZYidTyDew6IkPUyos=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "data_tamer_cpp";
  version = "0.9.4-4";
  src = sources.data_tamer_cpp;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ data_tamer_msgs mcap_vendor rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "DataTamer data logging library";
  };
}
