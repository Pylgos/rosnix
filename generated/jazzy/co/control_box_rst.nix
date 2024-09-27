{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    control_box_rst-d516096763524853e8317020610ec07aac7b0da4 = substituteSource {
      src = fetchgit {
        name = "control_box_rst-d516096763524853e8317020610ec07aac7b0da4-source";
        url = "https://github.com/ros2-gbp/control_box_rst-release.git";
        rev = "d516096763524853e8317020610ec07aac7b0da4";
        hash = "sha256-HEG9kwIr6mxkYCMU0hJzDgZZOsx5NgqjKf0y6BkwcbA=";
      };
      substitutions = [
        {
          path = "src/extern/grpc/CMakeLists.txt";
          from = "GIT_REPOSITORY \${GRPC_URL}";
          to = "URL ${grpc-vendor_source-b567bb43670f7f2523164fdabdea8786a7595854}";
        }
        {
          path = "src/extern/protobuf/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/google/protobuf.git";
          to = "URL ${protobuf-vendor_source-48cb18e5c419ddd23d9badcfe4e9df7bde1979b2}";
        }
        {
          path = "src/extern/yaml-cpp/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/jbeder/yaml-cpp.git";
          to = "URL ${yaml_cpp-vendor_source-ee99c4151c1af794a412b101a75921c086acaac0}";
        }
      ];
    };
    grpc-vendor_source-b567bb43670f7f2523164fdabdea8786a7595854 = substituteSource {
      src = fetchgit {
        name = "grpc-vendor_source-b567bb43670f7f2523164fdabdea8786a7595854-source";
        url = "https://github.com/grpc/grpc.git";
        rev = "b567bb43670f7f2523164fdabdea8786a7595854";
        hash = "sha256-dQt5gCHoxrEdkhMPKcVSvDKhPQEzN6fgq5klBucOZQQ=";
      };
      substitutions = [
      ];
    };
    protobuf-vendor_source-48cb18e5c419ddd23d9badcfe4e9df7bde1979b2 = substituteSource {
      src = fetchgit {
        name = "protobuf-vendor_source-48cb18e5c419ddd23d9badcfe4e9df7bde1979b2-source";
        url = "https://github.com/google/protobuf.git";
        rev = "48cb18e5c419ddd23d9badcfe4e9df7bde1979b2";
        hash = "sha256-xHCCXM7BtpIbWvJ6VbqNTIN+PomrprZY+YR5qn7l9lc=";
      };
      substitutions = [
      ];
    };
    yaml_cpp-vendor_source-ee99c4151c1af794a412b101a75921c086acaac0 = substituteSource {
      src = fetchgit {
        name = "yaml_cpp-vendor_source-ee99c4151c1af794a412b101a75921c086acaac0-source";
        url = "https://github.com/jbeder/yaml-cpp.git";
        rev = "ee99c4151c1af794a412b101a75921c086acaac0";
        hash = "sha256-D5brGCzg0v9SmCLcLx+NEOIXz//74ofQjA4kqw2LH4A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "control_box_rst";
  version = "0.0.7-1";
  src = sources.control_box_rst-d516096763524853e8317020610ec07aac7b0da4;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "coinor-libipopt-dev" "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The control_box_rst package provides C++ libraries for predictive control, direct optimal control, optimization and simulation.";
  };
}
