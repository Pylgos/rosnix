{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rmw_implementation,
  rosSystemPackages,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    performance_test = substituteSource {
      src = fetchFromGitHub {
        name = "performance_test-source";
        owner = "ros2-gbp";
        repo = "performance_test-release";
        rev = "05dbef9b6d0d3d460efe5452bdf58621e2c7f1b9";
        hash = "sha256-wlQOogTIJm3/yPmuBAhSGRXFNiy0UAJyPZfWK+NgsyQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/Tencent/rapidjson.git";
          to = "URL ${performance_test-vendor_source-rapidjson-1}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/mirror/tclap.git";
          to = "URL ${performance_test-vendor_source-tclap-0}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/p-ranav/tabulate.git";
          to = "URL ${performance_test-vendor_source-tabulate-2}";
        }
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/r-lyeh-archived/sole.git";
          to = "URL ${performance_test-vendor_source-sole-3}";
        }
      ];
    };
    performance_test-vendor_source-rapidjson-1 = substituteSource {
      src = fetchgit {
        name = "performance_test-vendor_source-rapidjson-1-source";
        url = "https://github.com/Tencent/rapidjson.git";
        rev = "f54b0e47a08782a6131cc3d60f94d038fa6e0a51";
        hash = "sha256-mFM1Etpf+qF/G0t91eXD8FQXwSQKyQbJq8gUA0jsm4Q=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-sole-3 = substituteSource {
      src = fetchFromGitHub {
        name = "performance_test-vendor_source-sole-3-source";
        owner = "r-lyeh-archived";
        repo = "sole";
        rev = "e4678426147adb9d4f9f978c9560a7d0343b8c32";
        hash = "sha256-HxTUT2NFLkg4MDqN8iIUr/22gXiWV0CKSi1TD0nSazc=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-tabulate-2 = substituteSource {
      src = fetchFromGitHub {
        name = "performance_test-vendor_source-tabulate-2-source";
        owner = "p-ranav";
        repo = "tabulate";
        rev = "57b1032aff2d8b115a56d20c2584170bae0ff852";
        hash = "sha256-yI6KLWjquuxnqXPe9Q4rPTwQv+FBr/EtPJx3fOqg63M=";
      };
      substitutions = [
      ];
    };
    performance_test-vendor_source-tclap-0 = substituteSource {
      src = fetchFromGitHub {
        name = "performance_test-vendor_source-tclap-0-source";
        owner = "mirror";
        repo = "tclap";
        rev = "799a8b1f99818e39fee19d0601030770af1221e1";
        hash = "sha256-kdrzAj5C/9AmA8OGntgmq4bAadAFzu6nz2brAddLNIk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "performance_test";
  version = "2.0.0-1";
  src = sources.performance_test;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rclcpp rmw_implementation rosidl_default_runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Tool to test performance of ROS2 and DDS data layers and communication.";
  };
}
