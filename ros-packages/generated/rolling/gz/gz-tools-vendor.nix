{
  ament-cmake-copyright,
  ament-cmake-core,
  ament-cmake-lint-cmake,
  ament-cmake-test,
  ament-cmake-vendor-package,
  ament-cmake-xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gz-cmake-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "gz_tools_vendor" = substituteSource {
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
          to = "VCS_TYPE path VCS_URL ${sources."gz_tools_vendor/gz-tools"}";
        }
      ];
    };
    "gz_tools_vendor/gz-tools" = substituteSource {
      src = fetchgit {
        name = "gz-tools-source";
        url = "https://github.com/gazebosim/gz-tools.git";
        rev = "efcc504bd3665151266f38db627c9095e5a5773f";
        hash = "sha256-sV/T53oVk1fgjwqn/SRTaPTukt+vAlGGxGvTN8+G6Mo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "gz_tools_vendor";
  version = "0.1.0-1";
  src = sources."gz_tools_vendor";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-test ament-cmake-vendor-package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz-cmake-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-tools2" "ruby" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "rubocop" ]; };
  meta = {
    description = "Vendor package for: gz-tools2 2.0.1 Gazebo Tools: Entrypoint to Gazebo's command line interface";
  };
}
