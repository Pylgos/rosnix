{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    swri_system_util-2261f4a6b02da112a51ad84a05bf984991e3a56f = substituteSource {
      src = fetchgit {
        name = "swri_system_util-2261f4a6b02da112a51ad84a05bf984991e3a56f-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "2261f4a6b02da112a51ad84a05bf984991e3a56f";
        hash = "sha256-4akj4akovewW9cszjNTNqoVOLqOKFVHwrFkXoE5ECLM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_system_util";
  version = "3.7.3-1";
  src = sources.swri_system_util-2261f4a6b02da112a51ad84a05bf984991e3a56f;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_index_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package with commonly used system utilities.";
  };
}
