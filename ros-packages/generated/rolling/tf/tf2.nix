{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rcutils,
  rosSystemPackages,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    tf2-86604e3174f40883f9b8ba76f00e929b7032e42f = substituteSource {
      src = fetchgit {
        name = "tf2-86604e3174f40883f9b8ba76f00e929b7032e42f-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "86604e3174f40883f9b8ba76f00e929b7032e42f";
        hash = "sha256-rO9Wz1RkhuskJyb8ebk9C/Rz3gF1U3GYiJfk28uWYco=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2";
  version = "0.38.2-1";
  src = sources.tf2-86604e3174f40883f9b8ba76f00e929b7032e42f;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rcutils rosidl_runtime_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_google_benchmark ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "tf2 is the second generation of the transform library, which lets the user keep track of multiple coordinate frames over time. tf2 maintains the relationship between coordinate frames in a tree structure buffered in time, and lets the user transform points, vectors, etc between any two coordinate frames at any desired point in time.";
  };
}
