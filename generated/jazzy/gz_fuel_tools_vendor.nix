{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_math_vendor,
  gz_msgs_vendor,
  gz_tools_vendor,
  gz_utils_vendor,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gz_fuel_tools_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "gz_fuel_tools_vendor-source";
        owner = "ros2-gbp";
        repo = "gz_fuel_tools_vendor-release";
        rev = "262d813ef8739b0697893e218b661b1d45230ea6";
        hash = "sha256-IMzeZsv+ckIsglxPwKG0qv1lO+h6kIErGNWD3Sx3E9c=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_fuel_tools_vendor-vendor_source-gz-fuel-tools-0}";
        }
      ];
    };
    gz_fuel_tools_vendor-vendor_source-gz-fuel-tools-0 = substituteSource {
      src = fetchFromGitHub {
        name = "gz_fuel_tools_vendor-vendor_source-gz-fuel-tools-0-source";
        owner = "gazebosim";
        repo = "gz-fuel-tools";
        rev = "9726ac5ec3299a7b13dc9d09db0edb1be08f9d96";
        hash = "sha256-txeIzj2vmvL5NDu6O07c7LwcCWE26OFEzvyc9TBrJAw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_fuel_tools_vendor";
  version = "0.0.5-1";
  src = sources.gz_fuel_tools_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gz_cmake_vendor gz_common_vendor gz_math_vendor gz_msgs_vendor gz_tools_vendor gz_utils_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gz-fuel_tools9" "libcurl-dev" "libgflags-dev" "libjsoncpp-dev" "libyaml-dev" "libzip-dev" "tinyxml2" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendor package for: gz-fuel_tools9 9.1.0 Gazebo Fuel Tools: Classes and tools for interacting with Gazebo Fuel";
  };
}
