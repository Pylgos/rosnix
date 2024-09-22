{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mimick_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "mimick_vendor-source";
        owner = "ros2-gbp";
        repo = "mimick_vendor-release";
        rev = "ec1c5a588d1ab270a3fdc76c142baeef167a34cd";
        hash = "sha256-Xr331CU6baKUiJO4PMtxhFW8eceLcNV4CWZLHGf0654=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros2/Mimick.git";
          to = "VCS_TYPE path VCS_URL ${mimick_vendor-vendor_source-Mimick-0}";
        }
      ];
    };
    mimick_vendor-vendor_source-Mimick-0 = substituteSource {
      src = fetchFromGitHub {
        name = "mimick_vendor-vendor_source-Mimick-0-source";
        owner = "ros2";
        repo = "Mimick";
        rev = "4dbd495e9f3d87a83c3201ef9d851e85f7133db7";
        hash = "sha256-4F3NiFxgwSOH1H5Njv0u78epF+jOzn7bUMcwuhRQznM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mimick_vendor";
  version = "0.6.2-1";
  src = sources.mimick_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around mimick, it provides an ExternalProject build of mimick.";
  };
}
