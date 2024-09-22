{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    tvm_vendor = substituteSource {
      src = fetchFromGitHub {
        name = "tvm_vendor-source";
        owner = "ros2-gbp";
        repo = "tvm_vendor-release";
        rev = "a415b453b01fd87caf6873f53e56e002c0354596";
        hash = "sha256-zx1sU7fTJXQqMOjy+jstX1Wq7B7zPKQCxlfV685GzSA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/apache/tvm";
          to = "URL ${tvm_vendor-vendor_source-tvm-0}";
        }
      ];
    };
    tvm_vendor-vendor_source-tvm-0 = substituteSource {
      src = fetchgit {
        name = "tvm_vendor-vendor_source-tvm-0-source";
        url = "https://github.com/apache/tvm";
        rev = "d361585965b95acfb35563b92a2011fe8059876c";
        hash = "sha256-lzLrd4vNK1c7BwWS0H5x1uDdZ3moUl+zWHb8G6gs8hw=";
      };
      substitutions = [
        {
          path = "apps/ios_rpc/CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/octoml/macho-dyld.git";
          to = "URL ${tvm_vendor-vendor_source-tvm-0-vendor_source-macho-dyld-0}";
        }
      ];
    };
    tvm_vendor-vendor_source-tvm-0-vendor_source-macho-dyld-0 = substituteSource {
      src = fetchFromGitHub {
        name = "tvm_vendor-vendor_source-tvm-0-vendor_source-macho-dyld-0-source";
        owner = "octoml";
        repo = "macho-dyld";
        rev = "0742b8129de7df1130be355b74faa8c036265bfc";
        hash = "sha256-OAa4FiviTL/KoUMLd/vaUFVUBol5C47MXZptb7nL278=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tvm_vendor";
  version = "0.9.1-4";
  src = sources.tvm_vendor;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ros_environment ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopenblas-dev" "libvulkan-dev" "libxml2" "ocl-icd-opencl-dev" "opencl-headers" "spirv-headers" "spirv-tools" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Wrapper around Apache TVM to make it available to the ROS ecosystem.";
  };
}
