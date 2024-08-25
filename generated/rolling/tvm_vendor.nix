{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  libxml2,
  openblas,
  opencl-headers,
  ros_environment,
  spirv-headers,
  spirv-tools,
  substituteSource,
  vulkan-loader,
}:
let
  sources = rec {
    tvm_vendor = substituteSource {
      src = fetchgit {
        name = "tvm_vendor-source";
        url = "https://github.com/ros2-gbp/tvm_vendor-release.git";
        rev = "86b5d14e89904fa76c2a266601ee5f171607445a";
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
      src = fetchgit {
        name = "tvm_vendor-vendor_source-tvm-0-vendor_source-macho-dyld-0-source";
        url = "https://github.com/octoml/macho-dyld.git";
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
  version = "0.9.1-3";
  src = sources.tvm_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ git ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libxml2 openblas opencl-headers spirv-headers spirv-tools vulkan-loader ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [ "ocl-icd-opencl-dev" ];
  meta = {
    description = "Wrapper around Apache TVM to make it available to the ROS ecosystem.";
  };
}
