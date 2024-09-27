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
    Mimick-vendor_source-1e138b0e13da99278453dc96af954890d9f48348 = substituteSource {
      src = fetchgit {
        name = "Mimick-vendor_source-1e138b0e13da99278453dc96af954890d9f48348-source";
        url = "https://github.com/ros2/Mimick.git";
        rev = "1e138b0e13da99278453dc96af954890d9f48348";
        hash = "sha256-V1HudbZtvYwbgUj4LSwUxb7kjtuOm5rcC+kPfTm335I=";
      };
      substitutions = [
      ];
    };
    mimick_vendor-b01399040b330352b2c22117afa389f6ce067095 = substituteSource {
      src = fetchgit {
        name = "mimick_vendor-b01399040b330352b2c22117afa389f6ce067095-source";
        url = "https://github.com/ros2-gbp/mimick_vendor-release.git";
        rev = "b01399040b330352b2c22117afa389f6ce067095";
        hash = "sha256-uSshp5NkdoruAwCynN5b1ADsO+pDt482iw6s1gKz9XM=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/ros2/Mimick.git";
          to = "VCS_TYPE path VCS_URL ${Mimick-vendor_source-1e138b0e13da99278453dc96af954890d9f48348}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "mimick_vendor";
  version = "0.8.1-1";
  src = sources.mimick_vendor-b01399040b330352b2c22117afa389f6ce067095;
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
