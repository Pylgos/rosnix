{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "resource_retriever";
  version = "3.9.1-1";
  src = finalAttrs.passthru.sources."resource_retriever";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-cpp ament-index-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libcurl-dev" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp ament-index-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libcurl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "resource_retriever" = substituteSource {
      src = fetchgit {
        name = "resource_retriever-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "0597b3c68ba474cb9bafcf49622dafab4364a59b";
        hash = "sha256-Wj2l2iwmyblvkdQ38zBm2QAg4mmim0l3ilLYnJ+NKsg=";
      };
    };
  });
  meta = {
    description = "\n   This package retrieves data from url-format files such as http://,\n   ftp://, package:// file://, etc., and loads the data into memory.\n   The package:// url for ros packages is translated into a local\n   file:// url.  The resourse retriever was initially designed to load\n   mesh files into memory, but it can be used for any type of\n   data. The resource retriever is based on the the libcurl library.\n  ";
  };
})
