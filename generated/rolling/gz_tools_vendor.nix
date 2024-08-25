{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  substituteSource,
}:
let
  sources = rec {
    gz_tools_vendor = substituteSource {
      src = fetchgit {
        name = "gz_tools_vendor-source";
        url = "https://github.com/ros2-gbp/gz_tools_vendor-release.git";
        rev = "083cec4758cccadb89a4f9378488e2973ac149c6";
        hash = "sha256-ixU28XwQpuvBdg20zvpUusc9YuvIYmO2InG9iTKg4MY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_tools_vendor-vendor_source-gz-tools-0}";
        }
      ];
    };
    gz_tools_vendor-vendor_source-gz-tools-0 = substituteSource {
      src = fetchgit {
        name = "gz_tools_vendor-vendor_source-gz-tools-0-source";
        url = "https://github.com/gazebosim/gz-tools.git";
        rev = "efcc504bd3665151266f38db627c9095e5a5773f";
        hash = "sha256-sV/T53oVk1fgjwqn/SRTaPTukt+vAlGGxGvTN8+G6Mo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_tools_vendor";
  version = "0.1.0-1";
  src = sources.gz_tools_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gz_cmake_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ];
  missingDependencies = [ "gz-tools2" "rubocop" "ruby" ];
  meta = {
    description = "Vendor package for: gz-tools2 2.0.1 Gazebo Tools: Entrypoint to Gazebo's command line interface";
  };
}
