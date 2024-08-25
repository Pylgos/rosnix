{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  data_tamer_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap_vendor,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    data_tamer_cpp = substituteSource {
      src = fetchgit {
        name = "data_tamer_cpp-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
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
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ data_tamer_msgs mcap_vendor rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "DataTamer data logging library";
  };
}
