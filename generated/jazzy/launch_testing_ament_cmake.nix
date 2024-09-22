{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_test,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  python_cmake_module,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_ament_cmake = substituteSource {
      src = fetchFromGitHub {
        name = "launch_testing_ament_cmake-source";
        owner = "ros2-gbp";
        repo = "launch-release";
        rev = "afe506445d42429c57e0486867d866ab7054a8a0";
        hash = "sha256-5+zwcqUD4kG22oYJie85A8Wl3jxRdcPmkUcQu/nGCFI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_ament_cmake";
  version = "3.4.2-2";
  src = sources.launch_testing_ament_cmake;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test python_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_test python_cmake_module ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [ launch_testing ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright launch_testing python_cmake_module ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package providing cmake functions for running launch tests from the build.";
  };
}
