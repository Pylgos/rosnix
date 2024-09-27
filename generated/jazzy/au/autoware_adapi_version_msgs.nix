{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    autoware_adapi_version_msgs-45b258f83827ee2dcad818ee64b51391e2e5cdaf = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_version_msgs-45b258f83827ee2dcad818ee64b51391e2e5cdaf-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "45b258f83827ee2dcad818ee64b51391e2e5cdaf";
        hash = "sha256-NgmJaOTPpTaLzuKySD64mVynkUKIS1hPwtV4ebCPdfs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_adapi_version_msgs";
  version = "1.3.0-1";
  src = sources.autoware_adapi_version_msgs-45b258f83827ee2dcad818ee64b51391e2e5cdaf;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The Autoware AD API version interfaces";
  };
}
