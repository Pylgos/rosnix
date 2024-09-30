{
  ament-cmake,
  ament-cmake-gtest,
  buildRosPackage,
  data-tamer-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "data_tamer_cpp" = substituteSource {
      src = fetchgit {
        name = "data_tamer_cpp-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "fbf9cbcb7bc45fe016d6428d6366f9cd556456de";
        hash = "sha256-2AzGQXKFYJAAluNZytnO9/Or37ZYidTyDew6IkPUyos=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "data_tamer_cpp";
  version = "0.9.4-3";
  src = sources."data_tamer_cpp";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ data-tamer-msgs mcap-vendor rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "DataTamer data logging library";
  };
}
