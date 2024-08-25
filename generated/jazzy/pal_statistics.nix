{
  ament_cmake_auto,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pal_statistics_msgs,
  python3Packages,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    pal_statistics = substituteSource {
      src = fetchgit {
        name = "pal_statistics-source";
        url = "https://github.com/ros2-gbp/pal_statistics-release.git";
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
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pal_statistics_msgs python3Packages.boost rclcpp rclcpp_lifecycle rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The pal_statistics package";
  };
}
