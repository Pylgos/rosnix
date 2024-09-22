{
  ament_cmake_auto,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_statistics_msgs,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    pal_statistics = substituteSource {
      src = fetchFromGitHub {
        name = "pal_statistics-source";
        owner = "ros2-gbp";
        repo = "pal_statistics-release";
        rev = "0327653fba3aff104f3471d72c47b99f1433367e";
        hash = "sha256-iuQqs6XBZ9nDhHWgffrR71peHVJVK9W4VBMRw/c3lm0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pal_statistics";
  version = "2.2.4-1";
  src = sources.pal_statistics;
  nativeBuildInputs = [ ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ pal_statistics_msgs rclcpp rclcpp_lifecycle rclpy ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The pal_statistics package";
  };
}
