{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "resource_retriever_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."resource_retriever_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "resource_retriever_interfaces" = substituteSource {
      src = fetchgit {
        name = "resource_retriever_interfaces-source";
        url = "https://github.com/ros2-gbp/resource_retriever_service-release.git";
        rev = "d051de12d6286fb12c49f2c8a09268ed7273e5e7";
        hash = "sha256-+05NeABhTxCYxyYc6R2v/SZH5yxxouwUfYeSSaiIP5M=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for working with resources like meshes.";
  };
})
