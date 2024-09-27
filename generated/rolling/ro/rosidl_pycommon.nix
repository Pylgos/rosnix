{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_pycommon-e9738d1d7fa9939313becbed59cae2729a662d77 = substituteSource {
      src = fetchgit {
        name = "rosidl_pycommon-e9738d1d7fa9939313becbed59cae2729a662d77-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "e9738d1d7fa9939313becbed59cae2729a662d77";
        hash = "sha256-2BitDnrOlRMxAJfeVf0gS58CWAfvtzYMQA3rkBRTyW0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_pycommon";
  version = "4.8.1-1";
  src = sources.rosidl_pycommon-e9738d1d7fa9939313becbed59cae2729a662d77;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl_parser ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl_parser ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Common Python functions used by rosidl packages.";
  };
}
