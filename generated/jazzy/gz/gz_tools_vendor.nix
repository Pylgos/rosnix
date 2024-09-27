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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz_tools-vendor_source-efcc504bd3665151266f38db627c9095e5a5773f = substituteSource {
      src = fetchgit {
        name = "gz_tools-vendor_source-efcc504bd3665151266f38db627c9095e5a5773f-source";
        url = "https://github.com/gazebosim/gz-tools.git";
        rev = "efcc504bd3665151266f38db627c9095e5a5773f";
        hash = "sha256-sV/T53oVk1fgjwqn/SRTaPTukt+vAlGGxGvTN8+G6Mo=";
      };
      substitutions = [
      ];
    };
    gz_tools_vendor-3a0a7ca81753ff2b366fee977f7bdc4ce3e4ecb5 = substituteSource {
      src = fetchgit {
        name = "gz_tools_vendor-3a0a7ca81753ff2b366fee977f7bdc4ce3e4ecb5-source";
        url = "https://github.com/ros2-gbp/gz_tools_vendor-release.git";
        rev = "3a0a7ca81753ff2b366fee977f7bdc4ce3e4ecb5";
        hash = "sha256-Ha0HMQgXsfsWhwB1+MDCeeqbDMl+52CXQr+dJ15EL+I=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_tools-vendor_source-efcc504bd3665151266f38db627c9095e5a5773f}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_tools_vendor";
  version = "0.0.4-1";
  src = sources.gz_tools_vendor-3a0a7ca81753ff2b366fee977f7bdc4ce3e4ecb5;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-tools2" "ruby" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rubocop" ]; };
  meta = {
    description = "Vendor package for: gz-tools2 2.0.1 Gazebo Tools: Entrypoint to Gazebo's command line interface";
  };
}
