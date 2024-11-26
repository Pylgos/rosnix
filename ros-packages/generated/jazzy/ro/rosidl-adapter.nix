{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_adapter";
  version = "4.6.4-1";
  src = finalAttrs.passthru.sources."rosidl_adapter";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-empy" ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_adapter" = substituteSource {
      src = fetchgit {
        name = "rosidl_adapter-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "5f5c3d207e17c5befad6f0ae71c1ea3d5c2cd8ac";
        hash = "sha256-elXi9n8QLHGPkNHcl9bXppCPla0/ZJQdBPqH+nIXNGU=";
      };
    };
  });
  meta = {
    description = "API and scripts to parse .msg/.srv/.action files and convert them to .idl.";
  };
})
