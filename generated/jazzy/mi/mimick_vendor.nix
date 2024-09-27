{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    Mimick-vendor_source-4dbd495e9f3d87a83c3201ef9d851e85f7133db7 = substituteSource {
      src = fetchgit {
        name = "Mimick-vendor_source-4dbd495e9f3d87a83c3201ef9d851e85f7133db7-source";
        url = "https://github.com/ros2/Mimick.git";
        rev = "4dbd495e9f3d87a83c3201ef9d851e85f7133db7";
        hash = "sha256-4F3NiFxgwSOH1H5Njv0u78epF+jOzn7bUMcwuhRQznM=";
      };
      substitutions = [
      ];
    };
    mimick_vendor-ec1c5a588d1ab270a3fdc76c142baeef167a34cd = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-ec1c5a588d1ab270a3fdc76c142baeef167a34cd-source";
        url = "https://github.com/ros2-gbp/mimick_vendor-release.git";
        rev = "ec1c5a588d1ab270a3fdc76c142baeef167a34cd";
        hash = "sha256-Xr331CU6baKUiJO4PMtxhFW8eceLcNV4CWZLHGf0654=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros2/Mimick.git";
          to = "VCS_TYPE path VCS_URL ${Mimick-vendor_source-4dbd495e9f3d87a83c3201ef9d851e85f7133db7}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "mimick_vendor";
  version = "0.6.2-1";
  src = sources.mimick_vendor-ec1c5a588d1ab270a3fdc76c142baeef167a34cd;
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
