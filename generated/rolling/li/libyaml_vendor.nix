{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    libyaml-vendor_source-2c891fc7a770e8ba2fec34fc6b545c672beb37e6 = substituteSource {
      src = fetchgit {
        name = "libyaml-vendor_source-2c891fc7a770e8ba2fec34fc6b545c672beb37e6-source";
        url = "https://github.com/yaml/libyaml.git";
        rev = "2c891fc7a770e8ba2fec34fc6b545c672beb37e6";
        hash = "sha256-S7PnooyfyAsIiRAlEPGYkgkVACGaBaCItuqOwrq2+qM=";
      };
      substitutions = [
      ];
    };
    libyaml_vendor-e0d389b6a2175a8175377dd5550f30ec9f639a1f = substituteSource {
      src = fetchgit {
        name = "libyaml_vendor-e0d389b6a2175a8175377dd5550f30ec9f639a1f-source";
        url = "https://github.com/ros2-gbp/libyaml_vendor-release.git";
        rev = "e0d389b6a2175a8175377dd5550f30ec9f639a1f";
        hash = "sha256-55n8TWCkEYdBKy14p9L6+mGPYgJwCJhQ7nHJp62YOWg=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/yaml/libyaml.git";
          to = "VCS_TYPE path VCS_URL ${libyaml-vendor_source-2c891fc7a770e8ba2fec34fc6b545c672beb37e6}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "libyaml_vendor";
  version = "1.7.0-1";
  src = sources.libyaml_vendor-e0d389b6a2175a8175377dd5550f30ec9f639a1f;
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
