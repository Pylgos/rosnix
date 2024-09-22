{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    libyaml_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "libyaml_vendor-source";
        owner = "ros2-gbp";
        repo = "libyaml_vendor-release";
        rev = "6716b363b25f6dd62d1d1673537ea10bc9f9c3d8";
        hash = "sha256-B4KqEW6DWzKfnmVCRwlG37WRdC5jasM41pTz21e1of0=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/yaml/libyaml.git";
          to = "VCS_TYPE path VCS_URL ${libyaml_vendor-vendor_source-libyaml-0}";
        }
      ];
    };
    libyaml_vendor-vendor_source-libyaml-0 = substituteSource {
      src = fetchFromGitHub {
        name = "libyaml_vendor-vendor_source-libyaml-0-source";
        owner = "yaml";
        repo = "libyaml";
        rev = "2c891fc7a770e8ba2fec34fc6b545c672beb37e6";
        hash = "sha256-S7PnooyfyAsIiRAlEPGYkgkVACGaBaCItuqOwrq2+qM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libyaml_vendor";
  version = "1.6.3-2";
  src = sources.libyaml_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libyaml" "libyaml-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common performance_test_fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Vendored version of libyaml.";
  };
}
