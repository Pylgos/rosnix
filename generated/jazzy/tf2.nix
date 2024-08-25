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
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    tf2 = substituteSource {
      src = fetchgit {
        name = "tf2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "a3cde480eeca378e3175de43b0de526b31601694";
        hash = "sha256-Jb+UxsNLB0QSOmFav6rMyiyfkTm5BnHT7sHM+CmHdjk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2";
  version = "0.36.4-1";
  src = sources.tf2;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rcutils rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_cppcheck ament_cmake_cpplint ament_cmake_google_benchmark ament_cmake_gtest ament_cmake_lint_cmake ament_cmake_uncrustify ament_cmake_xmllint ];
  missingDependencies = [  ];
  meta = {
    description = "tf2 is the second generation of the transform library, which lets the user keep track of multiple coordinate frames over time. tf2 maintains the relationship between coordinate frames in a tree structure buffered in time, and lets the user transform points, vectors, etc between any two coordinate frames at any desired point in time.";
  };
}
