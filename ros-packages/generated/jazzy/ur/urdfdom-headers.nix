{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "urdfdom_headers";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."urdfdom_headers";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom_headers" = substituteSource {
      src = fetchgit {
        name = "urdfdom_headers-source";
        url = "https://github.com/ros2-gbp/urdfdom_headers-release.git";
        rev = "1816d683f984c8e4dea5ba1267e560dc5b105c24";
        hash = "sha256-/OST7M1kRlexiNDFvfNy8xsYcOSiO7KdZTkzqZm+iKI=";
      };
    };
  });
  meta = {
    description = "\n    C++ headers for URDF.\n  ";
  };
})
