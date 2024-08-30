{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  spdlog,
  substituteSource,
}:
let
  sources = rec {
    hunter-spdlog-1_12_0-p0-vendor_source-benchmark-44 = substituteSource {
      src = fetchgit {
        name = "hunter-spdlog-1_12_0-p0-vendor_source-benchmark-44-source";
        url = "https://github.com/google/benchmark.git";
        rev = "f91b6b42b1b9854772a90ae9501464a161707d1e";
        hash = "sha256-EAJk3JhLdkuGKRMtspTLejck8doWPd7Z0Lv/Mvf3KFY=";
      };
      substitutions = [
      ];
    };
    spdlog_vendor = substituteSource {
      src = fetchgit {
        name = "spdlog_vendor-source";
        url = "https://github.com/ros2-gbp/spdlog_vendor-release.git";
        rev = "5044abc0cdde628dce0ebf8cff7f571d27878c14";
        hash = "sha256-0BY6luUFbdOJPREolo3FR1ZYPXi1nZG1OB84R+VkFiQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gabime/spdlog.git";
          to = "VCS_TYPE path VCS_URL ${spdlog_vendor-vendor_source-spdlog-0}";
        }
      ];
    };
    spdlog_vendor-vendor_source-spdlog-0 = substituteSource {
      src = fetchgit {
        name = "spdlog_vendor-vendor_source-spdlog-0-source";
        url = "https://github.com/gabime/spdlog.git";
        rev = "7e635fca68d014934b4af8a1cf874f63989352b7";
        hash = "sha256-cxTaOuLXHRU8xMz9gluYz0a93O0ez2xOxbloyc1m1ns=";
      };
      substitutions = [
        {
          path = "bench/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/benchmark.git";
          to = "URL ${hunter-spdlog-1_12_0-p0-vendor_source-benchmark-44}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "spdlog_vendor";
  version = "1.6.1-1";
  src = sources.spdlog_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ spdlog ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Wrapper around spdlog, providing nothing but a dependency on spdlog, on some systems. On others, it provides an ExternalProject build of spdlog.";
  };
}
