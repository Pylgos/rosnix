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
  libyaml,
  performance_test_fixture,
  pkg-config,
  substituteSource,
}:
let
  sources = rec {
    libyaml_vendor = substituteSource {
      src = fetchgit {
        name = "libyaml_vendor-source";
        url = "https://github.com/ros2-gbp/libyaml_vendor-release.git";
        rev = "e0d389b6a2175a8175377dd5550f30ec9f639a1f";
        hash = "sha256-55n8TWCkEYdBKy14p9L6+mGPYgJwCJhQ7nHJp62YOWg=";
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
      src = fetchgit {
        name = "libyaml_vendor-vendor_source-libyaml-0-source";
        url = "https://github.com/yaml/libyaml.git";
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
  version = "1.7.0-1";
  src = sources.libyaml_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common performance_test_fixture ];
  missingDependencies = [  ];
  meta = {
    description = "Vendored version of libyaml.";
  };
}
