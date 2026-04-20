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
  version = "0.0.1-1";
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
        rev = "ad0ca115c2281e4d3c75089c48edf4102cc1cb14";
        hash = "sha256-aBvjaxBYAZwciWPps+qGKt5+wGY+fiC6hJpb1zPQ1Cw=";
      };
    };
  });
  meta = {
    description = "ROS interfaces for working with resources like meshes.";
  };
})
