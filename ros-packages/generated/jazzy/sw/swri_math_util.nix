{
  ament_cmake,
  ament_cmake_gtest,
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
    swri_math_util-363bafe035c9c957140d9c593f8d04543b1aefae = substituteSource {
      src = fetchgit {
        name = "swri_math_util-363bafe035c9c957140d9c593f8d04543b1aefae-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "363bafe035c9c957140d9c593f8d04543b1aefae";
        hash = "sha256-7Tz49UJ5/aCgz0J73FqouSNfQvkBhH2+iWwJdYBnvog=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_math_util";
  version = "3.7.3-1";
  src = sources.swri_math_util-363bafe035c9c957140d9c593f8d04543b1aefae;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A package with commonly used math utility code.";
  };
}
